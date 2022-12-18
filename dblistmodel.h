#ifndef DBLISTMODEL_H
#define DBLISTMODEL_H

#include <QAbstractListModel>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QDebug>

/*struct Data {
    Data() {}
    Data( const QString& title,  const QString& start_date,  const QString& end_date,  const QString& status)
        : title(title), start_date(start_date), end_date(end_date),status(status) {}
    QString title;
    QString start_date;
    QString end_date;
    QString status;
};*/

struct Data {
    Data() {}
    Data( const QString& review_product,
          const QString& project_name,
          int report_number,
          const QString& reviewed_product_definition,
          const QString& product_size,
          const QString& produced_by,
          const QString& peer_review_responsible,
          const QString& start_date,
          const QString& end_date,
          const QString& status)
        : review_product(review_product),
          project_name(project_name),
          report_number(report_number),
          reviewed_product_definition(reviewed_product_definition),
          product_size(product_size),
          produced_by(produced_by),
          peer_review_responsible(peer_review_responsible),
          start_date(start_date),
          end_date(end_date),
          status(status) {}

    QString review_product;
    QString project_name;
    int report_number;
    QString reviewed_product_definition;
    QString product_size;
    QString produced_by;
    QString peer_review_responsible;
    QString start_date;
    QString end_date;
    QString status;

};

class DBListModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        ReviewProductRole,
        ProjectNameRole,
        ReportNumberRole = Qt::UserRole,
        ReviewedProductDefinitionRole,
        ProductSizeRole,
        ProducedByRole,
        PeerReviewResponsibleRole,
        StartDateRole,
        EndDateRole,
        StatusRole
    };

    explicit DBListModel(QObject *parent = nullptr);

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    QHash<int, QByteArray> roleNames() const override;

private:
    QVector<Data> m_data;
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
};

#endif // DBLISTMODEL_H
