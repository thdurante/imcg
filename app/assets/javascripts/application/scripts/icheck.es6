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
        checkboxClass: 'icheckbox_square-red',
        radioClass: 'iradio_square-red'
      }
    )
  }
}
