$(function () {
  const components = [
    new Datepicker(),
    new FlashMessage(),
    new ICheck()
  ]

  components.forEach((component) => {
    component.init()
  })
});
