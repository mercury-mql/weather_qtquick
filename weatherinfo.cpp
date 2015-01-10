#include "weatherinfo.h"
#include <QUrl>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QNetworkAccessManager>

class WeatherInfoPrivate
{
public:
    WeatherInfoPrivate(WeatherInfo* p, const QString& code)
        :m_q(p), m_cityCode(code)
    {

    }

    void process()
    {
        QString source = "http://wthrcdn.etouch.cn/WeatherApi?citykey=" + m_cityCode;
        QUrl url(source);
    }

public slots:
    void onFinished()
    {

    }

    WeatherInfo* m_q;
    QNetworkReply* m_reply;
    QNetworkAccessManager m_networkAcessManager;

    QHash< int, QString > m_infos;
    QString m_cityCode;
};

WeatherInfo::WeatherInfo(QObject *parent)
    : QObject(parent), m_pd(new WeatherInfoPrivate(this, "101120301"))
{

}

WeatherInfo::~WeatherInfo()
{
    delete m_pd;
}

void WeatherInfo::process()
{
    m_pd->process();
}

void WeatherInfo::setCityCode(const QString &code)
{
    m_pd->m_cityCode = code;
    m_pd->process();
    emit cityCodeChanged();
}

QString WeatherInfo::infoByKey(INFO_W key)
{
    return m_pd->m_infos.value(key, "");
}

