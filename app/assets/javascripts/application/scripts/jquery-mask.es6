class JQueryMask {
  constructor() {
    this.cpfMaskElement = $('.js-cpf-mask')
    this.phoneMaskElement = $('.js-phone-mask')
  }

  init() {
    this.cpfMaskElement.mask('000.000.000-00', {})
    this.phoneMaskElement.mask('00000000000', { reverse: true })
  }
}
