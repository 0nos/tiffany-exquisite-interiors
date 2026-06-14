# deploy.ps1 - Fast one-click deploy (no message typing needed)

Write-Host "Deploying changes..." -ForegroundColor Cyan

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$message = "Update site - $timestamp"

git add .
if (-not (git status --porcelain)) {
    Write-Host "No changes detected. Nothing to deploy." -ForegroundColor Yellow
    exit
}
git commit -m "$message"
git push

Write-Host ""
Write-Host "Pushed to GitHub!" -ForegroundColor Green
Write-Host "Netlify is redeploying... (check in ~30-60 seconds)" -ForegroundColor Yellow
