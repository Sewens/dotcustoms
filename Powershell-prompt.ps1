oh-my-posh init pwsh --config 'C:/Users/scorp/.posh/thecyberden-lawbda.omp.json' | Invoke-Expression
Import-Module posh-git # git的自动补全
# 配置控制台颜色以在特定主题下提高对比度
Set-PSReadLineOption -Colors @{
    Keyword            = '#E4C07A'  #brightYellow
    Variable           = '#E4C07A'  #brightYellow
    Operator            = '#E4C07A'  #brightYellow
    Parameter          = '#E4C07A'  #brightWhite
}
