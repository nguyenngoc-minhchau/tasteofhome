export function isStrongPassword(password: string): boolean {
  // Chỉ yêu cầu ít nhất 6 ký tự
  const minLength = /.{6,}/
  
  return minLength.test(password)
}
