class ModalController {
    constructor($modal) {
        this.$modal = $modal
    }
    open(url) {
        $modal.open({
            url
        })

    }

}