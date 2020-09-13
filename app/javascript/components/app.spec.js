import { mount } from '@vue/test-utils'

import axios from 'axios'

import App from './app'

jest.mock('axios')

describe('App', () => {
  let wrapper

  function mountWrapper(isUserCorrect = true) {
    axios.get.mockImplementationOnce(jest.fn(() => Promise.resolve({
      data: {
        name: 'pikachu',
      }
    })))
    axios.post.mockImplementation(jest.fn(() => Promise.resolve({
      data: {
        correct: isUserCorrect,
      }
    })))

    return mount(App)
  }

  describe('displaying an error', () => {
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

  describe('displaying a pokemon', () => {
    beforeEach(() => {
      wrapper = mountWrapper()
    })

    it('displays the title', () => {
      expect(wrapper.text()).toMatch('Is It a Pokemon')
    })

    it('fetches the pokemon from the correct API', () => {
      expect(axios.get).toHaveBeenCalledWith('/random')
    })

    it('displays the pokemon name', () => {
      expect(wrapper.text()).toMatch('Pikachu')
    })

    it('displays a button to answer yes or no', () => {
      let buttons = wrapper.findAll('button')
      expect(buttons.length).toBe(2)
      expect(buttons.wrappers.map(button => button.text())).toEqual(['No', 'Yes'])
    })
  })


  describe('the "yes" button', () => {
    let button

    beforeEach(() => {
      wrapper = mountWrapper()
    })

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

      it('asks the API if they were right', async () => {
        expect(axios.post).toHaveBeenCalledWith('/answer', {
          pokemon: 'pikachu', real: true
        })
      })

      it('displays that they were correct', () => {
        expect(wrapper.text()).toMatch('Correct')
      })

      describe('when they are wrong', () => {
        beforeEach(() => {
          wrapper = mountWrapper(false)
        })

        beforeEach(async () => {
          button = wrapper.findAll('button')
            .filter(button => button.text() === 'Yes')
          await button.trigger('click')
        })

        it('displays that they were incorrect', async () => {
          expect(wrapper.text()).toMatch('Wrong')
        })
      })
    })
  })

  describe('the "no" button', () => {
    let button

    beforeEach(() => {
      wrapper = mountWrapper()
    })

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

      it('asks the API if they were right', async () => {
        expect(axios.post).toHaveBeenCalledWith('/answer', {
          pokemon: 'pikachu', real: false
        })
      })

      it('displays that they were correct', () => {
        expect(wrapper.text()).toMatch('Correct')
      })

      describe('when they are wrong', () => {
        beforeEach(() => {
          wrapper = mountWrapper(false)
        })

        beforeEach(async () => {
          button = wrapper.findAll('button')
            .filter(button => button.text() === 'No')
          await button.trigger('click')
        })

        it('displays that they were incorrect', async () => {
          expect(wrapper.text()).toMatch('Wrong')
        })
      })
    })
  })

  describe('play again button', () => {
    let playAgainButton

    beforeEach(() => {
      wrapper = mountWrapper()
    })

    beforeEach(async () => {
      let yesButton = wrapper.findAll('button')
        .filter(button => button.text() === 'Yes')
      await yesButton.trigger('click')
    })

    beforeEach(() => {
      playAgainButton = wrapper.findAll('button')
        .filter(button => button.text() === 'Play Again?')
    })

    it('exists', () => {
      expect(playAgainButton.exists()).toBe(true)
    })

    describe('when clicked', () => {
      beforeEach(async () => {
        axios.get.mockImplementationOnce(jest.fn(() => Promise.resolve({
          data: {
            name: 'bulbasaur',
          }
        })))
        await playAgainButton.trigger('click')
      })

      it('fetches a new pokemmon', () => {
        expect(axios.get).toHaveBeenCalledWith('/random')
      })

      it('displays the new pokemon', () => {
        expect(wrapper.text()).toMatch('Bulbasaur')
      })
    })
  })
})
