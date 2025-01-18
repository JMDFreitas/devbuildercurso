public with sharing class AccountConstants {
    private RecordTypeSelector recordtypeSelector { get; set; }

    public AccountConstants() {
        recordtypeSelector = new RecordTypeSelector();
    }

    public final Id RECORDTYPEID_PARCEIRO {
        get {
            if (RECORDTYPEID_PARCEIRO == null) {
                RECORDTYPEID_PARCEIRO = recordtypeSelector.selectByDeveloperName('Account', 'Parceiro');
            }
            return RECORDTYPEID_PARCEIRO;
        }
        private set;
    }

    public final String RECORDTYPE_NAME_PARCEIRO {
        get {
            if (RECORDTYPE_NAME_PARCEIRO == null) {
                System.debug('RTID:' + this.RECORDTYPEID_PARCEIRO);
                RECORDTYPE_NAME_PARCEIRO = recordtypeSelector.selectById('Account', this.RECORDTYPEID_PARCEIRO);
            }
            return RECORDTYPE_NAME_PARCEIRO;
        }
        private set;
    }

    public final Id RECORDTYPEID_CONSUMIDOR_FINAL {
        get {
            if (RECORDTYPEID_CONSUMIDOR_FINAL == null) {
                RECORDTYPEID_CONSUMIDOR_FINAL = recordtypeSelector.selectByDeveloperName('Account', 'ConsumidorFinal');
            }
            return RECORDTYPEID_CONSUMIDOR_FINAL;
        }
        private set;
    }

    public final String RECORDTYPE_NAME_CONSUMIDOR_FINAL {
        get {
            if (RECORDTYPE_NAME_CONSUMIDOR_FINAL == null) {
                RECORDTYPE_NAME_CONSUMIDOR_FINAL = recordtypeSelector.selectById('Account', this.RECORDTYPEID_CONSUMIDOR_FINAL);
            }
            return RECORDTYPE_NAME_CONSUMIDOR_FINAL;
        }
        private set;
    }
    
    public final Id RECORDTYPEID_PESSOA_JURIDICA {
        get {
            if (RECORDTYPEID_PESSOA_JURIDICA == null) {
                RECORDTYPEID_PESSOA_JURIDICA = recordtypeSelector.selectByDeveloperName('Account', 'Pessoa_Juridica');
            }
            return RECORDTYPEID_PESSOA_JURIDICA;
        }
        private set;
    }
}