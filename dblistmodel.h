#ifndef DBLISTMODEL_H
#define DBLISTMODEL_H

#include <QAbstractListModel>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QDebug>

struct Data {
    Data() {}
    Data( const QString& title,  const QString& start_date,  const QString& end_date,  const QString& status)
        : title(title), start_date(start_date), end_date(end_date),status(status) {}
    QString title;
    QString start_date;
    QString end_date;
    QString status;
};

class DBListModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        TitleRole = Qt::UserRole,
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
