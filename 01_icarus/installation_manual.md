

## Install Scoop

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

Verify
```powershell
scoop --version
```

## Install Icarus and GTKWave

```powershell
scoop install iverilog
```

Verify

```powershell
iverilog -V
gtkwave --version
```

## Install GNUMake

```powershell
scoop install make
```

Verify

```powershell
make --version
```


## Install Git

```powershell
`scoop install git`
```

Verify

```powershell
git --version
```
