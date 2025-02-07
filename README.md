# gem5_tardistso
Repository che contiene la patch per installare il protocollO Tardis 2.0 - Total Store Order nel simulatore gem5 versione 23.1

# Requisiti
Architettura x86

Ubuntu 22.04 oppure WSL 2 (se su Windows)

# Istruzioni
Basterà eseguire gli script secondo l'ordine enumerato:
* ./1.install_requirements.sh: installa i pacchetti richiesti per buildare il simulatore;
* ./2.install_gem5.sh: clona la repository di gem5, passa alla versione 23.1 e installa la patch di Tartdis TSO;
* ./3.build_gem5.sh: compila gem5 con il protocollo Tardis TSO incluso;
* ./4.run_mfence.sh: esegue il workload mfence;
* ./5.run_spinlock.sh: esegue il workload basato su spinlock;
* ./6.run_ubuntu_boot.sh: esegue un boot completo di linux (richiede dall 2 alle 8 ore);
