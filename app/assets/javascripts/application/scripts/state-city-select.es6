class StateCitySelect {
  constructor() {
    this.stateElement = $('.js-address-state')
    this.cityElement = $('.js-address-city')
  }

  init() {
    if (this.stateElement.val() !== '') {
      this.performCitiesRequest()
    }

    this.stateElement.on('change', () => {
      this.performCitiesRequest()
    })
  }

  performCitiesRequest() {
    $.ajax({
      url: '/addresses/cities?state=' + this.stateElement.val(),
      method: 'GET'
    }).done((data) => {
      const selectedCity = this.cityElement.val()
      this.cityElement.empty()

      data.forEach((city) => {
        if (selectedCity === city) {
          this.cityElement.append($('<option></option>').attr('value', city).attr('selected', true).text(city))
        } else {
          this.cityElement.append($('<option></option>').attr('value', city).text(city))
        }
      })

      this.cityElement.attr('disabled', false)
      this.cityElement.selectpicker('refresh')
    }).fail((error) => {
      toastr.error('Erro na requisição')
      console.log(error)
    })
  }
}
