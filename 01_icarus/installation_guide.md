# Installation Guide

## 1. Install Scoop

1. Set the execution policy to allow the installation:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

2. Install Scoop:

```powershell
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

3. Verify the installation:

```powershell
scoop --version
```

## 2. Install Icarus Verilog and GTKWave

1. Install Icarus Verilog:

```powershell
scoop install iverilog
```

3. Verify the installations:

```powershell
iverilog -V
gtkwave --version
```

## 3. Install GNU Make

1. Install GNU Make:

```powershell
scoop install make
```

2. Verify the installation:

```powershell
make --version
```

## 4. Install Git

1. Install Git:

```powershell
scoop install git
```

2. Verify the installation:

```powershell
git --version
```