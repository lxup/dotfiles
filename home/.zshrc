export PATH="$HOME/.nix-profile/bin:$PATH"

alias zed="zeditor"

if [[ "$OSTYPE" == "darwin"* ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
  export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
  export ANDROID_HOME="$HOME/Library/Android/sdk"
else
  export PNPM_HOME="$HOME/.local/share/pnpm"
  export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
  export ANDROID_HOME="$HOME/Android/Sdk"
fi

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
