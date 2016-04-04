'use strict';

import React from 'react';
import EnqueteSelection from './EnqueteSelection';

export default class EnqueteSelectionList extends React.Component
{
    constructor()
    {
        super();

        this.state = {
            dataSource: []
        };

        this.deleteObject = this.deleteObject.bind(this);
    }

    deleteObject(id)
    {
        var dataSource = this.state.dataSource;

        for (var index in dataSource) {
            if (dataSource[index].id === id) {
                dataSource.splice(parseInt(index), 1);
            }
        }

        this.setState({
            error : "",
            dataSource: dataSource
        });
    }

    _addSelection()
    {
        var dataSource = this.state.dataSource;

        // 最大10個まで
        if (dataSource.length >= 10) {
            this.setState({error: "選択肢は最大10個までです。"});
            return;
        }

        dataSource.push({
            title: null,
            id: "selection" + (dataSource.length + 1)
        });

        this.setState({
            dataSource: dataSource
        });
    }

    render()
    {
        var lists = this.state.dataSource.map((data) => {
            return <EnqueteSelection key={data.id} id={data.id} deleteObject={this.deleteObject} />;
        });

        var err_tag;

        if (this.state.error) {
            err_tag = <span className="mdl-color-text--red-900">{this.state.error}</span>;
        }

        return (
            <div>
                {lists}
                {err_tag}
                <div className="mdl-grid">
                    <div className="mdl-cell mdl-cell--2-col">
                        <button className="mdl-button mdl-js-button mdl-button--fab mdl-button--colored" type="button" onClick={this._addSelection.bind(this)}>
                            <i className="material-icons">add</i>
                        </button>
                    </div>
                </div>
            </div>
        );
    }
}
