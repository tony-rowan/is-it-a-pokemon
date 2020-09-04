import { mount } from '@vue/test-utils'

import Question from './question'

describe('Question', () => {
  let wrapper = mount(Question, {
    propsData: {
      pokemon: {
        id: 15,
        name: 'pikachu'
      }
    }
  })

  it('displays the formatted pokemon name', () => {
    expect(wrapper.text()).toMatch('Pikachu')
  })

  describe('response buttons', () => {
    let buttons = wrapper.findAll('button')
    let yesButton = buttons.filter(button => button.text() === 'Yes')
    let noButton = buttons.filter(button => button.text() === 'No')

    it('exist', () => {
      expect(yesButton.exists()).toBe(true)
      expect(noButton.exists()).toBe(true)
    })

    it('generate appropriate event when clicked', async () => {
      await yesButton.trigger('click')
      await noButton.trigger('click')
      expect(wrapper.emitted('answer')).toEqual([[true], [false]])
    })
  })
})
