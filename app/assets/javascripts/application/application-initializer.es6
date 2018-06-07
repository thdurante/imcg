$(function () {
  const components = [
    new Datepicker(),
    new FlashMessage(),
    new ICheck(),
    new JQueryMask(),
    new Select2(),
    new BootstrapSelect(),
    new StateCitySelect(),
    new SwitcheryComponent(),
    new TooltipComponent()
  ]

  components.forEach((component) => {
    component.init()
  })
});
