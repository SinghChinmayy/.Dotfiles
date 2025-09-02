# Tmux Configuration Management & Backup Guide

A comprehensive guide for managing your tmux configuration with Git version control and automated backups.

## Quick Setup

### 1. **Move Config to Repository**
```bash
# Create dotfiles directory in your repo
mkdir ~/your-repo/dotfiles

# Move existing tmux config to repo
mv ~/.tmux.conf ~/your-repo/dotfiles/tmux.conf

# Create symlink from home directory to repo
ln -s ~/your-repo/dotfiles/tmux.conf ~/.tmux.conf
```

### 2. **Verify Setup**
```bash
# Check if symlink is working
ls -la ~/.tmux.conf
# Should show: ~/.tmux.conf -> /path/to/your-repo/dotfiles/tmux.conf

# Test tmux config
tmux source-file ~/.tmux.conf
```

## Configuration Features

### **Key Bindings**
- **Prefix**: `Ctrl-a` (instead of default `Ctrl-b`)
- **Reload config**: `Ctrl-a r`
- **Rename window**: `Ctrl-a R`
- **Split panes**: 
  - `|` horizontal split (creates vertical pane)
  - `-` vertical split (creates horizontal pane)
  - `\` and `_` for full-width/height splits
- **Window navigation**:
  - `Space` toggle to last window
  - `p` previous window
  - `<` and `>` swap windows left/right

### **Productivity Features**
- **Vi-mode** key bindings enabled
- **Mouse support** for clicking and resizing
- **256-color** and true color support
- **Path awareness** - new windows/panes open in current directory
- **5000 lines** scrollback history
- **No auto-rename** windows

### **Plugins**
- **TPM** (Tmux Plugin Manager)
- **Dracula theme** for beautiful styling
- **tmux-sensible** for better defaults
- **tmux-yank** for enhanced copy/paste

## Backup Management

### **Manual Backup**
```bash
cd ~/your-repo
git add dotfiles/tmux.conf
git commit -m "Update tmux config: [describe changes]"
git push origin main
```

### **Automated Backup Script**
Create `backup-dotfiles.sh`:
```bash
#!/bin/bash
cd ~/your-repo
git add .
git commit -m "Backup dotfiles: $(date)"
git push origin main
echo "Dotfiles backed up successfully!"
```

Make it executable:
```bash
chmod +x backup-dotfiles.sh
```

### **Automated Daily Backup**
Add to crontab (`crontab -e`):
```bash
# Backup dotfiles daily at 6 PM
0 18 * * * /path/to/your/backup-dotfiles.sh >> ~/backup.log 2>&1
```

## Configuration Customization

### **Adding New Key Bindings**
Add to your `tmux.conf`:
```bash
# Example: Bind 'S' to new session
bind-key S command-prompt "new-session -s '%%'"

# Example: Bind 'K' to kill pane
bind-key K confirm-before kill-pane
```

### **Plugin Management**
Add new plugins:
```bash
# Add to tmux.conf
set -g @plugin 'plugin-name'

# Install new plugins: Ctrl-a + I
# Update plugins: Ctrl-a + U
# Remove plugins: Ctrl-a + alt + u
```

## Installation on New Machine

### **Fresh Setup**
```bash
# Clone your repo
git clone https://github.com/yourusername/your-repo.git

# Create symlink
ln -s ~/your-repo/dotfiles/tmux.conf ~/.tmux.conf

# Install TPM (if not already installed)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Start tmux and install plugins
tmux
# Press: Ctrl-a + I
```

### **Prerequisites**
- tmux installed
- Git configured
- GitHub access (SSH keys recommended)

## Troubleshooting

### **Common Issues**

**Symlink not working:**
```bash
# Remove broken symlink
rm ~/.tmux.conf

# Recreate symlink with absolute path
ln -s $(pwd)/dotfiles/tmux.conf ~/.tmux.conf
```

**Plugins not loading:**
```bash
# Reinstall TPM
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Reload config and install plugins
tmux source-file ~/.tmux.conf
# Press: Ctrl-a + I
```

**Colors not working:**
```bash
# Check terminal support
echo $TERM
# Should show: xterm-256color or similar

# Test colors
tmux info | grep Tc
```

## File Structure
```
your-repo/
├── dotfiles/
│   ├── tmux.conf          # Main tmux configuration
│   └── other-configs...   # Other dotfiles
├── backup-dotfiles.sh     # Backup script
└── README.md             # This guide
```

## Key Configuration Sections

### **Essential Settings**
- Prefix key change to `Ctrl-a`
- Window/pane indexing from 1
- Vi-mode keys
- Mouse support
- Path-aware window creation

### **Performance Optimizations**
- Reduced escape time (1ms)
- 5000 line history buffer
- Focus events enabled
- Visual notifications configured

### **Styling**
- Dracula theme via plugin
- True color support
- Custom status bar (commented examples included)

## Best Practices

1. **Test changes** before committing
2. **Use descriptive commit messages**
3. **Keep backups regular** (daily recommended)
4. **Document custom bindings** in comments
5. **Version control everything** - include plugin configs

## Quick Reference

| Command | Action |
|---------|---------|
| `Ctrl-a r` | Reload config |
| `Ctrl-a R` | Rename window |
| `Ctrl-a \|` | Split horizontally |
| `Ctrl-a -` | Split vertically |
| `Ctrl-a Space` | Last window |
| `Ctrl-a </>` | Swap windows |

***

**Pro Tip**: Always test your tmux config in a new session before committing changes to avoid breaking your current workflow.
