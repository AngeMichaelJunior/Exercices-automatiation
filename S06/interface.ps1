Add-Type -AssemblyName PresentationFramework
[xml]$xaml = @"
<Window
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
x:Name="Window">
 <Grid>
       <Button x:Name="btn" Grid.Column="1" Content="copier" HorizontalAlignment="Left" Margin="405,116,0,0" VerticalAlignment="Top" Height="26" Width="51"/>
 <TextBlock x:Name="output" Grid.Column="1" HorizontalAlignment="Left" Margin="137,189,0,0" TextWrapping="Wrap" Text="TextBlock" VerticalAlignment="Top" Height="28" Width="94"/>
 <TextBox x:Name="input" Grid.Column="1" HorizontalAlignment="Left" Margin="114,116,0,0" TextWrapping="Wrap" Text="TextBox" VerticalAlignment="Top" Width="120"/>
 </Grid>
</Window>
"@
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

#code
$btn = $window.findName('btn')
$text = $window.FindName('input')
$output = $windows.FindName('output')

#action
$btn.Add_Click({
    write-output $input.Text
    $output.text = $text.txt
})
$window.ShowDialog()
