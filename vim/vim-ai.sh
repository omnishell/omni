declare -A VIM_AI_MODELS
VIM_AI_MODELS[gemini]="google/gemini-2.5-flash"
VIM_AI_MODELS[qwen]="qwen/qwen3-30b-a3b:free"
VIM_AI_MODELS[gpt]="openai/gpt-5.1"
VIM_AI_MODELS[gpt-mini]="openai/5.1-mini"
VIM_AI_MODELS[gpt-o4]="openai/o4-mini-high"
VIM_AI_MODELS[gpt-o3]="openai/o3-mini-high"
VIM_AI_MODELS[deep]="tngtech/deepseek-r1t-chimera:free"
VIM_AI_MODELS[claude]="anthropic/claude-3.7-sonnet"
VIM_AI_MODELS[claude-think]="anthropic/claude-3.7-sonnet:thinking"

function ai(){
    for model in "${!VIM_AI_MODELS[@]}"; do
        if [[ "$1" == "$model" ]]; then
            shift
            local text="${*:-""}"
            vim  -c "let g:vim_ai_chat = { 'options': { 'model': '${VIM_AI_MODELS[$model]}', 'endpoint_url': 'https://openrouter.ai/api/v1/chat/completions', 'token_file_path': '/home/yx/sec/openrouter.token' } }" -c "AIChat $text" 
            vim "$tmpfile"
            return
        fi
    done
    local text="${*:-""}"
    vim -c "AIChat $text"
}

_ai_completion() {
    local cur prev opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(echo "${!VIM_AI_MODELS[@]}")

    if [[ ${COMP_CWORD} -eq 1 ]]; then
        COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
        return 0
    fi
}

complete -F _ai_completion ai
