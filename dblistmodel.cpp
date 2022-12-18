#include "dblistmodel.h"

DBListModel::DBListModel(QObject *parent)
    : QAbstractListModel(parent)
{
    // Connect to the database
    db.setDatabaseName("C:\\Programming\\qt_projects\\revtooldb.db");
    db.open();

    m_data.clear();

    QString query_string = "SELECT * FROM REVIEWS";
    QSqlQuery query(query_string);

    while (query.next())
    {
        QSqlRecord record = query.record();
        m_data << Data(
                    record.value("TITLE").toString(),
                    record.value("START DATE").toString(),
                    record.value("END DATE").toString(),
                    record.value("STATUS").toString()
                );
    }

    db.close();
}

int DBListModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    return m_data.count();
}

QVariant DBListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    const Data &data = m_data.at(index.row());
    if ( role == TitleRole ){
        return data.title;
    }
    else if ( role == StartDateRole )
        return data.start_date;
    else if ( role == EndDateRole )
        return data.end_date;
    else if ( role == StatusRole )
        return data.status;
    else
        return QVariant();
}

QHash<int, QByteArray> DBListModel::roleNames() const
{
    static QHash<int, QByteArray> mapping {
        {TitleRole, "title"},
        {StartDateRole, "start_date"},
        {EndDateRole, "end_date"},
        {StatusRole, "status"}
    };
    return mapping;
}
