'use strict';

import DetailDialog from './DetailDialog';

var forEach = Array.prototype.forEach;

class ShowEnqueteModal
{
    constructor()
    {
        var dialog_links = document.querySelectorAll('.show-enquete-detail');

        forEach.call(dialog_links, dialog_link => {
            // 回答するボタンのイベント
            dialog_link.addEventListener('click', function() {
                var enquete_id = this.getAttribute('value');
                new DetailDialog().show(enquete_id);
            });
        });
    }
}

new ShowEnqueteModal();
