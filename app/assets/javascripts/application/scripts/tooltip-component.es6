class TooltipComponent {
  constructor() {
    this.tooltipElement = $("[data-component='tooltip']")
  }

  init() {
    this.tooltipElement.tooltip()
  }
}
