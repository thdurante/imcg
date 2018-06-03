class SwitcheryComponent {
  constructor() {
    let nodeList = document.querySelectorAll('[data-component="js-switch"]')
    this.switcheryElements = Array.from(nodeList)
  }

  init() {
    this.switcheryElements.forEach(element => {
      new Switchery(element, this.switcheryOptions())

      element.onchange = () => {
        if (element.dataset.autoSubmit === 'true') {
          $(element).closest('form').trigger('submit.rails')
        }
      }
    })
  }

  switcheryOptions() {
    return (
      {
        color: '#ED5565',
        size: 'small'
      }
    )
  }
}
