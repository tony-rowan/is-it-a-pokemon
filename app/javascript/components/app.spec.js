import { mount } from '@vue/test-utils'

import axios from 'axios'

import App from './app'

jest.mock('axios')

describe('App', () => {
  let wrapper = mount(App)

  it('displays the title', () => {
    expect(wrapper.text()).toMatch('Is It a Pokemon')
  })

  describe('when the pokemon can be fetched', () => {
    beforeEach(() => {
      axios.get.mockImplementation(jest.fn(() => Promise.resolve({
        data: {
          name: 'pikachu',
          real: true
        }
      })))

      wrapper = mount(App)
    })

    it('fetches the pokemon from the correct API', () => {
      expect(axios.get).toHaveBeenCalledWith('/pokemon')
    })

    it('displays the pokemon name', () => {
      expect(wrapper.text()).toMatch('Pikachu')
    })

    describe('the yes button', () => {
      let button;

      beforeEach(() => {
        button = wrapper.findAll('button')
          .filter(button => button.text() === 'Yes')
      })

      it('exists', () => {
        expect(button.exists()).toBe(true)
      })

      describe('when clicked', () => {
        beforeEach(async () => {
          await button.trigger('click')
        })

        it('displays that they got the answer correct', () => {
          expect(wrapper.text()).toMatch('Correct')
        })

        describe('play again button', () => {
          let playAgainButton;

          beforeEach(() => {
            playAgainButton = wrapper.findAll('button')
              .filter(button => button.text() === 'Play Again?')
          })

          it('displays a button to play again', () => {
            expect(playAgainButton.exists()).toBe(true)
          })

          describe('when clicked', () => {
            it('fetches and displays a new pokemon', async () => {
              axios.get.mockImplementation(jest.fn(() => Promise.resolve({
                data: {
                  name: 'bulbasaur',
                  real: true
                }
              })))

              await playAgainButton.trigger('click')

              expect(axios.get).toHaveBeenCalledWith('/pokemon')
              expect(wrapper.text()).toMatch('Bulbasaur')
            })
          })
        })
      })
    })

    describe('the no button', () => {
      let button;

      beforeEach(() => {
        button = wrapper.findAll('button')
          .filter(button => button.text() === 'No')
      })

      it('exists', () => {
        expect(button.exists()).toBe(true)
      })

      describe('when clicked', () => {
        beforeEach(async () => {
          await button.trigger('click')
        })

        it('displays that they got the answer wrong', () => {
          expect(wrapper.text()).toMatch('Wrong')
        })

        describe('play again button', () => {
          let playAgainButton;

          beforeEach(() => {
            playAgainButton = wrapper.findAll('button')
              .filter(button => button.text() === 'Play Again?')
          })

          it('displays a button to play again', () => {
            expect(playAgainButton.exists()).toBe(true)
          })

          describe('when clicked', () => {
            it('fetches and displays a new pokemon', async () => {
              axios.get.mockImplementation(jest.fn(() => Promise.resolve({
                data: {
                  name: 'bulbasaur',
                  real: true
                }
              })))

              await playAgainButton.trigger('click')

              expect(axios.get).toHaveBeenCalledWith('/pokemon')
              expect(wrapper.text()).toMatch('Bulbasaur')
            })
          })
        })
      })
    })
  })

  describe('when the pokemon cannot be fetched', () => {
    beforeEach(() => {
      axios.get.mockImplementation(jest.fn(() => Promise.reject('Bad Request')))

      wrapper = mount(App)
    })

    it('displays an error', () => {
      expect(wrapper.text()).toMatch('Error Displaying Pokemon')
      expect(wrapper.text()).toMatch('Bad Request')
    })

    it('displays no buttons', () => {
      expect(wrapper.find('button').exists()).toBe(false)
    })
  })
})
