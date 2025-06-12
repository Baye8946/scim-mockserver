. .\scim-functions.ps1

$scimBaseUrl = "http://localhost:8880/scim/v2"
$headers = @{ "Accept" = "application/scim+json" }

$users = Get-Content "./users.json" | ConvertFrom-Json

foreach ($user in $users) {
    $userPayload = @{
        userName = $user.userName
        name = @{
            givenName  = $user.givenName
            familyName = $user.familyName
        }
        emails = @(@{ value = $user.email; primary = $true })
    }

    $uri = "$scimBaseUrl/Users"
    $response = Invoke-ScimApi -Uri $uri -Method Post -Headers $headers -Body $userPayload

    if ($response -and $response.id) {
        Log-Message "User $($user.userName) created with ID: $($response.id)"
        foreach ($group in $user.groups) {
            Log-Message "Assigned $($user.userName) to group: $group (simulated)"
        }
    } else {
        Log-Message "Failed to create user: $($user.userName)"
    }
}
