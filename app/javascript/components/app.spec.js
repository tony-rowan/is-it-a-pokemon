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
          name: 'Pikachu',
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
  })
})
