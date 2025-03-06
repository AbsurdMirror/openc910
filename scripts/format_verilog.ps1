param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)

# 检查文件是否存在
if (-not (Test-Path $FilePath)) {
    Write-Error "文件不存在: $FilePath"
    exit 1
}

# 执行格式化并覆盖原文件
try {
    python $PSScriptRoot\comment_block_formater.py $FilePath | Set-Content $FilePath -Encoding ([System.Text.Encoding]::UTF8)
    Write-Host "成功格式化文件: $FilePath"
} catch {
    Write-Error "格式化失败: $_"
    exit 1
}