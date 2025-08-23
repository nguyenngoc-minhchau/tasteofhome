/**
 * Tao ra mot token ngau nhien voi do dai duoc chi dinh.
 * @param length Do dai cua token, mac dinh la 32 ky tu.
 * @returns Mot chuoi ky tu ngau nhien.
 */
export function generateRandomToken(length: number = 32): string {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let result = '';
  const charactersLength = characters.length;
  for (let i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}
