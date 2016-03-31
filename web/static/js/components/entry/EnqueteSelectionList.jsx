'use strict';

import React from 'react';

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
            return (
               <div key={data.id} className="mdl-grid">
                   <div className="mdl-cell mdl-cell--12-col">
                       <div className="mdl-textfield mdl-js-textfield">
                           <input className="mdl-textfield__input" type="text" id={data.id} name="enquete[selection[]]"></input>
                           <label className="mdl-textfield__label" htmlFor={data.id}>選択肢を入力してください</label>
                       </div>
                   </div>
               </div>
            );
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
