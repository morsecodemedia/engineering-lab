runtime_session_loop() {

    local history=""

    while true; do

        printf "\n> "

        IFS= read -r prompt || break

        [[ "${prompt}" == "/exit" ]] && break

        response="$(
            printf "%s\n\nUser:\n%s" \
                "${history}" \
                "${prompt}" \
            | runtime_ai_infer
        )"

        printf "\n%s\n" "${response}"

        history+=$'\n'
        history+="User: ${prompt}"$'\n'
        history+="Assistant: ${response}"$'\n'

    done

}