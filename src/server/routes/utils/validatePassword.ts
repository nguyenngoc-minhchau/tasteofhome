export function isStrongPassword(password: string): boolean {
  const minLength = /.{8,}/
  const hasUppercase = /[A-Z]/
  const hasLowercase = /[a-z]/
  const hasNumber = /[0-9]/
  const hasSpecialChar = /[^A-Za-z0-9]/

  return (
    minLength.test(password) &&
    hasUppercase.test(password) &&
    hasLowercase.test(password) &&
    hasNumber.test(password) &&
    hasSpecialChar.test(password)
  )
}
