function localStorageSupport() {
  return (('localStorage' in window) && window['localStorage'] !== null)
}
