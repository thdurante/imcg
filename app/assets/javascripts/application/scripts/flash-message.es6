class FlashMessage {
  constructor() {
    this.flashMessageElement = $('[data-flash-message]').eq(0)
  }

  init() {
    this.configToastrOptions()
    if (this.flashMessageElement.length > 0) { this.showToastrMessage() }
  }

  configToastrOptions() {
    toastr.options = {
      'progressBar': true,
      'newestOnTop': true,
      'showDuration': '300',
      'hideDuration': '1000',
      'timeOut': '15000',
      'extendedTimeOut': '1000',
      'showEasing': 'swing',
      'hideEasing': 'linear',
      'showMethod': 'fadeIn',
      'hideMethod': 'fadeOut'
    }
  }

  showToastrMessage() {
    const type = this.flashMessageElement.attr('data-flash-message')
    const message = this.flashMessageElement.text()

    toastr[{ notice: 'success', alert: 'error', warning: 'warning' }[type]](message)
    this.flashMessageElement.remove()
  }
}
