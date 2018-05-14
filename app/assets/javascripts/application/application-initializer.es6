$(function () {
  const components = [
    new Datepicker(),
    new FlashMessage(),
    new ICheck(),
    new JQueryMask()
  ]

  components.forEach((component) => {
    component.init()
  })
});
