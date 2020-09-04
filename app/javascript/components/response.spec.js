import { mount } from '@vue/test-utils'

import Response from './response'

describe('Response', () => {
  describe('when the user is correct', () => {
    let wrapper = mount(Response, {
      propsData: {
        correct: true
      }
    })

    it('displays whether the use was correct or wrong', () => {
      expect(wrapper.text()).toMatch('Correct')
    })

    describe('the play again button', () => {
      let button = wrapper.find('button')

      it('exists', () => {
        expect(button.exists()).toBe(true)
      })

      it('it emits a play again button when clicked', async () => {
        await button.trigger('click')
        expect(wrapper.emitted('play-again')).toEqual([[]])
      })
    })
  })

  describe('when the user is wrong', () => {
    let wrapper = mount(Response, {
      propsData: {
        correct: false
      }
    })

    it('displays whether the use was correct or wrong', () => {
      expect(wrapper.text()).toMatch('Wrong')
    })
  })
})
