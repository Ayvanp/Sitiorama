import esTranslations from './es.json';
import enTranslations from './en.json';

type Translations = Record<string, string>;

const allTranslations: Record<string, Translations> = {
  es: esTranslations as Translations,
  en: enTranslations as Translations,
};

export function useTranslations(locale: string | undefined) {
  const lang = (locale === 'en' || locale === 'es') ? locale : 'es';
  
  return function t(key: string, params?: Record<string, string | number>): string {
    let text = allTranslations[lang]?.[key] || allTranslations['es']?.[key] || key;

    if (params) {
      Object.keys(params).forEach(paramKey => {
        text = text.replace(new RegExp(`{${paramKey}}`, 'g'), String(params[paramKey]));
      });
    }
    return text;
  };
}