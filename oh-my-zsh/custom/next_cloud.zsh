# https://github.com/nextcloud/all-in-one
nc-prod() {
 (sudo docker exec --user www-data -it nextcloud-aio-nextcloud $@)
}
nc-prod-root() {
 (sudo docker exec --user root -it nextcloud-aio-nextcloud $@)
}
alias nc-prod-occ="nc-prod php occ"
alias nc-prod-bash="nc-prod bash"
alias nc-prod-root-bash="nc-prod-root bash"

# https://github.com/juliusknorr/nextcloud-docker-dev
nc-dev() {
 (cd ~/Development/NextCloud/nextcloud-docker-dev && sudo docker compose $@)
}
alias nc-dev-occ="nc-dev exec nextcloud occ"
alias nc-dev-bash="nc-dev exec nextcloud bash"
alias nc-dev-up="nc-dev up nextcloud"
alias nc-dev-down="nc-dev down"
