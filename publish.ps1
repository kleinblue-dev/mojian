# 把 index.html 发布到 gh-pages 分支（GitHub Pages 只发布该分支）
# 用法：在仓库根目录执行  ./publish.ps1
$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repo

$branch = 'gh-pages'
$tmp = Join-Path $env:TEMP ("mojian-pages-" + [guid]::NewGuid().ToString('N').Substring(0, 8))

# 确保远端分支存在
git fetch origin $branch 2>$null | Out-Null

git worktree add $tmp origin/$branch --detach | Out-Null
try {
    Copy-Item "$repo\index.html" "$tmp\index.html" -Force
    Copy-Item "$repo\robots.txt" "$tmp\robots.txt" -Force
    Copy-Item "$repo\.nojekyll" "$tmp\.nojekyll" -Force
    Set-Location $tmp
    git add -A
    git commit -m "publish $(Get-Date -Format 'yyyy-MM-dd HH:mm')" | Out-Null
    git push origin HEAD:$branch
    Write-Host "已发布到 $branch 分支，约 30 秒后生效。"
}
finally {
    Set-Location $repo
    git worktree remove $tmp --force 2>$null | Out-Null
}
