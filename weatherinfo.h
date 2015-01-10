#ifndef WEATHERINFO_H
#define WEATHERINFO_H

#include <QObject>
#include <QHash>
#include <QString>

class WeatherInfoPrivate;
class WeatherInfo : public QObject
{
    Q_OBJECT
    Q_ENUMS(INFO_W)
    Q_PROPERTY(QString cityCode READ cityCode WRITE setCityCode NOTIFY cityCodeChanged)
public:
    explicit WeatherInfo(QObject *parent = 0);
    ~WeatherInfo();

    QString cityCode() const { return m_cityCode; }
    void setCityCode( const QString& code );

    enum INFO_W{
        W_CITY,
        W_WENDU,
        W_FENGLI,
        W_SHIDU,
        W_SUNRISE_1,
        W_SUNSET_1,

        W_Y_DATE,
        W_Y_HIGH,
        W_Y_LOW,
        W_Y_DAY_TYPE,
        W_Y_DAY_FX,
        W_Y_DAY_FL,
        W_Y_NIGHT_TYPE,
        W_Y_NIGHT_FX,
        W_Y_NIGHT_FL,

        W_F0_DATE,
        W_F0_HIGH,
        W_F0_LOW,
        W_F0_DAY_TYPE,
        W_F0_DAY_FX,
        W_F0_DAY_FL,
        W_F0_NIGHT_TYPE,
        W_F0_NIGHT_FX,
        W_F0_NIGHT_FL,

        W_F1_DATE,
        W_F1_HIGH,
        W_F1_LOW,
        W_F1_DAY_TYPE,
        W_F1_DAY_FX,
        W_F1_DAY_FL,
        W_F1_NIGHT_TYPE,
        W_F1_NIGHT_FX,
        W_F1_NIGHT_FL,

        W_F2_DATE,
        W_F2_HIGH,
        W_F2_LOW,
        W_F2_DAY_TYPE,
        W_F2_DAY_FX,
        W_F2_DAY_FL,
        W_F2_NIGHT_TYPE,
        W_F2_NIGHT_FX,
        W_F2_NIGHT_FL,

        W_F3_DATE,
        W_F3_HIGH,
        W_F3_LOW,
        W_F3_DAY_TYPE,
        W_F3_DAY_FX,
        W_F3_DAY_FL,
        W_F3_NIGHT_TYPE,
        W_F3_NIGHT_FX,
        W_F3_NIGHT_FL,

        W_F4_DATE,
        W_F4_HIGH,
        W_F4_LOW,
        W_F4_DAY_TYPE,
        W_F4_DAY_FX,
        W_F4_DAY_FL,
        W_F4_NIGHT_TYPE,
        W_F4_NIGHT_FX,
        W_F4_NIGHT_FL,

        W_ZS0_NAME,
        W_ZS0_DESC,
        W_ZS0_DETAIL,

        W_ZS1_NAME,
        W_ZS1_DESC,
        W_ZS1_DETAIL,

        W_ZS2_NAME,
        W_ZS2_DESC,
        W_ZS2_DETAIL,

        W_ZS3_NAME,
        W_ZS3_DESC,
        W_ZS3_DETAIL,

        W_ZS4_NAME,
        W_ZS4_DESC,
        W_ZS4_DETAIL,

        W_ZS5_NAME,
        W_ZS5_DESC,
        W_ZS5_DETAIL,

        W_ZS6_NAME,
        W_ZS6_DESC,
        W_ZS6_DETAIL,

        W_ZS7_NAME,
        W_ZS7_DESC,
        W_ZS7_DETAIL,

        W_ZS8_NAME,
        W_ZS8_DESC,
        W_ZS8_DETAIL,

        W_ZS9_NAME,
        W_ZS9_DESC,
        W_ZS9_DETAIL,

        W_ZS10_NAME,
        W_ZS10_DESC,
        W_ZS10_DETAIL,
    };

    Q_INVOKABLE QString infoByKey(INFO_W key);

signals:
    void cityCodeChanged();

private:
    void process();

private:
    WeatherInfoPrivate* m_pd;
};

#endif // WEATHERINFO_H
