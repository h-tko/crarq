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
        this.enquete_id = enquete_id;

        this._callEnqueteDataApi(enquete_id)
        .then(resolve => {
            this._setData(resolve);

            this.dialog.showModal();
        })
        .catch(reject => {
            console.log(reject);
        });
    }

    answer()
    {
        if (this.enquete_id == null) {
            return;
        }

        var selection_id = $('input[name=selection]').val();

        this._callAnswerApi(this.enquete_id, selection_id)
        .then(resolve => {
            alert('回答を完了しました');
            this.dialog.close();
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

        // selection
        var selections = data.enquete.selections;
        for (var idx in selections) {
            var radio = $('<div class="mdl-grid"><div class="mdl-cell mdl-cell--12-col">').append($('<label class="mdl-radio mdl-js-radio">').attr('for', 'selection_' + selections[idx].selection_id).append($('<input type="radio" name="selection" class="mdl-radio__button">').attr('id', 'selection_' + selections[idx].selection_id).val(selections[idx].selection_id)).append($('<span>').text(selections[idx].text)));

            $(this.dialog).find("#selections").append(radio);
        }

        componentHandler.upgradeDom();
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

    _callAnswerApi(enquete_id, selection_id)
    {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/current_enquete_list/answer/' + enquete_id + '/' + selection_id + '/',
                type: 'GET',
            })
            .done(data => {
                return resolve();
            })
            .fail(err => {
                return reject(err);
            });
        });
    }
}
