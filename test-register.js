// Test script để kiểm tra API register
const testRegister = async () => {
  try {
    console.log('Testing register API...')
    
    const response = await fetch('http://localhost:3001/api/register', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        name: 'Test User',
        email: 'test@example.com',
        password: '123456'
      }),
    })

    const data = await response.json()
    console.log('Response status:', response.status)
    console.log('Response data:', data)
    
    if (response.ok) {
      console.log('✅ Register successful!')
    } else {
      console.log('❌ Register failed:', data.error)
    }
  } catch (error) {
    console.error('❌ Error testing register:', error)
  }
}

// Chạy test
testRegister()
