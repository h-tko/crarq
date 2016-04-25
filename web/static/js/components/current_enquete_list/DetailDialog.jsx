'use strict';

import React from 'react';

export default class DetailDialog
{
    constructor()
    {
        this.dialog = document.querySelector('dialog.mdl-dialog');

        if (!this.dialog.showModal) {
            dialogPolyfill.registerDialog(this.dialog);
        }

        this.dialog.querySelector('.close').addEventListener('click', () => {
            this.dialog.close();
        });
    }

    show(enquete_id)
    {
        this._callEnqueteDataApi(enquete_id)
        .then(resolve => {
            this._setData(resolve);

            this.dialog.showModal();
        })
        .catch(reject => {
            console.log(reject);
        });
    }

    _setData(data)
    {
        this.dialog.querySelector('.mdl-dialog__title').innerText = data.enquete.title;
        this.dialog.querySelector('#description').innerText = data.enquete.description;
        this.dialog.querySelector('#category').innerText = data.enquete.category;
    }

    _callEnqueteDataApi(enquete_id)
    {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/current_enquete_list/detail/' + enquete_id,
                type: 'GET',
            })
            .done(data => {
                data = data.data;

                return resolve(data);
            })
            .fail(err => {
                return reject(err);
            });
        });
    }
}
