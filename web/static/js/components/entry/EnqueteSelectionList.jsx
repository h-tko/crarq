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
    }

    _addSelection()
    {
        var dataSource = this.state.dataSource;

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
            return <EnqueteSelection id={data.id} />;
        });

        return (
            <div>
                {lists}
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
