'use strict';

import DetailDialog from './DetailDialog';

var forEach = Array.prototype.forEach;

class ShowEnqueteModal
{
    constructor()
    {
        var dialog_links = document.querySelectorAll('.show-enquete-detail');
        this.dialog = new DetailDialog();

        forEach.call(dialog_links, dialog_link => {
            // 回答するボタンのイベント
            dialog_link.addEventListener('click', () => {
                var enquete_id = dialog_link.getAttribute('value');
                this.dialog.show(enquete_id);
            });
        });

        document.getElementById('answer-btn').addEventListener('click', () => {
            this.dialog.answer();
        });
    }
}

new ShowEnqueteModal();
