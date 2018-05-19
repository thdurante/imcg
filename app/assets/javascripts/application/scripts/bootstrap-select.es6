class BootstrapSelect {
  constructor() {
    this.boostrapSelectComponent = $("[data-component='bootstrap-select']")
  }

  init() {
    this.setup()
    this.boostrapSelectComponent.selectpicker({
      liveSearch: true,
      dropupAuto: false,
      container: 'body',
      title: this.boostrapSelectComponent.attr('data-bootstrap-select-title') || 'Selecione...'
    })

    $('.bootstrap-select').addClass(this.boostrapSelectComponent.attr('data-bootstrap-select-class'))
  }

  setup() {
    $.fn.selectpicker.defaults = {
      liveSearchPlaceholder: 'Buscar...',
      noneSelectedText: '',
      noneResultsText: 'Nenhum resultado contendo {0}',
      countSelectedText: 'Selecionado {0} de {1}',
      maxOptionsText: ['Limite excedido (máx. {n} {var})', 'Limite do grupo excedido (máx. {n} {var})', ['itens', 'item']],
      multipleSeparator: ', '
    }
  }
}
