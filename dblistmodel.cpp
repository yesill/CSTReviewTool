#include "dblistmodel.h"

DBListModel::DBListModel(QObject *parent)
    : QAbstractListModel(parent)
{
    // Connect to the database
    db.setDatabaseName("C:\\Programming\\qt_projects\\reviewtooldb.db");
    db.open();

    m_data.clear();

    QString query_string = "SELECT * FROM REVIEWS";
    QSqlQuery query(query_string);

    while (query.next())
    {
        QSqlRecord record = query.record();
        m_data << Data(
                      record.value("Review Product").toString(),
                      record.value("Project Name").toString(),
                      record.value("Report Number").toInt(),
                      record.value("Reviewed Product Definition").toString(),
                      record.value("Product Size").toString(),
                      record.value("Produced By").toString(),
                      record.value("Peer Review Responsible").toString(),
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
    if ( role == ReviewProductRole )
        return data.review_product;
    else if ( role == ProjectNameRole )
        return data.project_name;
    else if ( role == ReportNumberRole )
        return data.report_number;
    else if ( role == ReviewedProductDefinitionRole )
        return data.reviewed_product_definition;
    else if ( role == ProductSizeRole )
        return data.product_size;
    else if ( role == ProducedByRole )
        return data.produced_by;
    else if ( role == PeerReviewResponsibleRole )
        return data.peer_review_responsible;
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
        {ReviewProductRole, "review_product"},
        {ProjectNameRole, "project_name"},
        {ReportNumberRole, "report_number"},
        {ReviewedProductDefinitionRole, "reviewed_product_definition"},
        {ProductSizeRole, "product_size"},
        {ProducedByRole, "produced_by"},
        {PeerReviewResponsibleRole, "peer_review_responsible"},
        {StartDateRole, "start_date"},
        {EndDateRole, "end_date"},
        {StatusRole, "status"}
    };
    return mapping;
}
