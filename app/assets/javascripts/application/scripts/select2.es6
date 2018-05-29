class Select2 {
  constructor() {
    this.select2Element = $('[data-component="select2"]').eq(0)
  }

  init() {
    this.select2Element.select2({
      placeholder: 'Selecione...'
    })
  }
}
