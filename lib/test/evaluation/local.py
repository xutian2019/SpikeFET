from pathlib import Path

from .environment import EnvSettings


def local_env_settings():
    settings = EnvSettings()
    project_dir = Path(__file__).resolve().parents[3]

    # Set your local paths here.

    settings.coesot_path = "/data2/xutian/sot_dataset/COESOT"
    settings.fe108_path = "/data2/xutian/sot_dataset/FE108"
    settings.network_path = str(project_dir / "output/test/networks")
    settings.prj_dir = str(project_dir)
    settings.result_plot_path = str(project_dir / "output/test/result_plots")
    settings.results_path = str(project_dir / "output/test/tracking_results")
    settings.save_dir = str(project_dir / "output")
    settings.segmentation_path = str(project_dir / "output/test/segmentation_results")
    settings.visevent_path = "/data2/xutian/sot_dataset/VisEvent"

    return settings
