function logInBox(message) {
  let bannerLength = message.length + 2
  let topBottomBorder = `${'+-'.padEnd(bannerLength, '-')}-+`
  let topBottomPadding = `${'| '.padEnd(bannerLength, ' ')} |`
  let bannerMessage = `| ${message} |`

  console.log(topBottomBorder)
  console.log(topBottomPadding)
  console.log(bannerMessage)
  console.log(topBottomPadding)
  console.log(topBottomBorder)
}


logInBox('To boldly go where no one has gone before.');