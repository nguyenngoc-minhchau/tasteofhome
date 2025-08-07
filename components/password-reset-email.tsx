"use client"

// This component represents the email template that would be sent to users
// In a real application, this would be handled by your email service

interface PasswordResetEmailProps {
  userEmail: string
  resetToken: string
  resetUrl: string
}

export function PasswordResetEmail({ userEmail, resetToken, resetUrl }: PasswordResetEmailProps) {
  return (
    <div className="max-w-2xl mx-auto bg-white border rounded-lg overflow-hidden">
      {/* Email Header */}
      <div className="bg-gradient-to-r from-amber-600 to-orange-700 text-white p-6">
        <div className="flex items-center gap-2">
          <div className="h-8 w-8 bg-white rounded-md flex items-center justify-center">
            <span className="text-amber-600 font-bold text-sm">WT</span>
          </div>
          <h1 className="text-xl font-bold">WorldTaste</h1>
        </div>
      </div>

      {/* Email Content */}
      <div className="p-6 space-y-4">
        <h2 className="text-2xl font-bold text-gray-800">Reset Your Password</h2>

        <p className="text-gray-600">
          Hello! We received a request to reset the password for your WorldTaste account associated with{" "}
          <strong>{userEmail}</strong>.
        </p>

        <p className="text-gray-600">
          If you made this request, click the button below to reset your password. If you didn't request a password
          reset, you can safely ignore this email.
        </p>

        {/* Reset Button */}
        <div className="text-center py-6">
          <a
            href={resetUrl}
            className="inline-block bg-amber-600 hover:bg-amber-700 text-white font-medium py-3 px-8 rounded-lg text-decoration-none"
            style={{ textDecoration: "none" }}
          >
            Reset My Password
          </a>
        </div>

        {/* Alternative Link */}
        <div className="bg-gray-50 p-4 rounded-lg">
          <p className="text-sm text-gray-600 mb-2">
            If the button above doesn't work, copy and paste this link into your browser:
          </p>
          <p className="text-sm text-blue-600 break-all">{resetUrl}</p>
        </div>

        {/* Security Information */}
        <div className="border-t pt-4 space-y-2">
          <h3 className="font-semibold text-gray-800">Important Security Information:</h3>
          <ul className="text-sm text-gray-600 space-y-1">
            <li>• This reset link will expire in 1 hour for your security</li>
            <li>• This link can only be used once</li>
            <li>• If you didn't request this reset, please contact our support team</li>
            <li>• Never share this link with anyone</li>
          </ul>
        </div>

        {/* Footer */}
        <div className="border-t pt-4 text-center text-sm text-gray-500">
          <p>This email was sent to {userEmail} because a password reset was requested for your WorldTaste account.</p>
          <p className="mt-2">
            If you have questions, contact us at{" "}
            <a href="mailto:support@worldtaste.com" className="text-amber-600">
              support@worldtaste.com
            </a>
          </p>
          <p className="mt-4">&copy; 2024 WorldTaste. All rights reserved.</p>
        </div>
      </div>
    </div>
  )
}
