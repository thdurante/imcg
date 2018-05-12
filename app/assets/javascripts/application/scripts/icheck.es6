class ICheck {
  constructor() {
    this.iCheckElement = $('[data-component="iCheck"]')
  }

  init() {
    this.iCheckElement.iCheck(this.iCheckOptions())
  }

  iCheckOptions() {
    return (
      {
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
      }
    )
  }
}
