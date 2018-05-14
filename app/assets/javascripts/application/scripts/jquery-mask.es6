class JQueryMask {
  constructor() {
    this.cpfMaskElement = $('.js-cpf-mask')
  }

  init() {
    this.cpfMaskElement.mask('000.000.000-00', {})
  }
}
